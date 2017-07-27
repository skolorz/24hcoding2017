/**
Open Bank Project - API
Copyright (C) 2011 - 2015, TESOBE Ltd.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

This product includes software developed at
TESOBE (http://www.tesobe.com/)
by
Simon Redfern : simon AT tesobe DOT com
Stefan Bethge : stefan AT tesobe DOT com
Everett Sochowski : everett AT tesobe DOT com
Ayoub Benali: ayoub AT tesobe DOT com


TESOBE Ltd.
Osloer Str. 16/17
Berlin 13359, Germany
Email: contact@tesobe.com

*/


package code.snippet

import java.net.URLDecoder
import java.util.Date

import code.model.dataAccess.{MappedAccountHolder, OBPUser}
import code.model.{Consumer, Nonce, Token, TokenType}
import code.util.Helper
import net.liftweb.common.{Empty, Failure, Full}
import net.liftweb.http.S
import net.liftweb.mapper.By
import net.liftweb.util.Helpers._
import net.liftweb.util.{CssSel, Helpers, Props}

import scala.collection.mutable
import scala.xml.NodeSeq

object OAuthAuthorisation {

  val LogUserParam = "logUser"
  val FailedLoginParam = "failedLogin"
  val TokenIdParam = "token_id"
  val TokenVerifiedParam = "token_verified"
  val BankTemplateParam = "bankTemplate"

  val AppAskBlocSel = "#appAskBloc"
  val LoginBlocSel = "#loginBloc"
  val ErrorMessageSel = "#errorMessage"
  val VerifierBlocSel = "#verifierBloc"
  val TokenVerifyBlocSel = "#tokenVerifyBloc"

  def shouldNotLogIn(): Boolean = {
    S.param(LogUserParam) match {
      case Full("false") => true
      // IF NO PARAM, IT SHOULD RETURN FALSE
      case Empty => false
      case _ => false
    }
  }

  def hideFailedLoginMessageIfNeeded() = {
    S.param(FailedLoginParam) match {
      case Full("true") => ".login-error" #> "Incorrect username or password"
      case _ => ".login-error" #> ""
    }
  }

  def hideFailedTokenMessageIfNeeded() = {
    S.param(TokenVerifiedParam) match {
      case Full("false") => ".token-error" #> "Token not verified"
      case _ => ".token-error" #> ""
    }
  }

  def isTokenVerified() = {
    S.param(TokenVerifiedParam) match {
      case Full("true") => {
        if (TokenVerifier.isTokenVerified(S.param(TokenIdParam).get.toLong))
          true
        else {
          false
        }
      }
      case _ => {
        false
      }
    }
  }

  // this method is specific to the authorization page ( where the user logs in to grant access
  // to the application (step 2))
  def tokenCheck = {

    def loginError(msg: String): CssSel = {
      ErrorMessageSel #> S.?(msg) &
        AppAskBlocSel #> NodeSeq.Empty &
        LoginBlocSel #> NodeSeq.Empty &
        VerifierBlocSel #> NodeSeq.Empty &
        TokenVerifyBlocSel #> NodeSeq.Empty
    }

    def tokenVerifyError(msg: String): CssSel = {
      ErrorMessageSel #> S.?(msg) &
        AppAskBlocSel #> NodeSeq.Empty &
        LoginBlocSel #> NodeSeq.Empty &
        VerifierBlocSel #> NodeSeq.Empty
    }

    //TODO: refactor into something nicer / more readable
    def validTokenCase(appToken: Token, unencodedTokenParam: String): CssSel = {

      Consumer.find(By(Consumer.id, appToken.consumerId)) match {
        case Full(consumer) => {
          if (shouldNotLogIn() && isTokenVerified()) {

            // 3 STEP: VERIFIER AND REDIRECT

            if (!TokenVerifier.useToken(S.param(TokenIdParam).get, appToken))
              tokenVerifyError("Login token is not valid")

            var verifier = ""
            // if the user is logged in and no verifier have been generated
            if (appToken.verifier.isEmpty) {
              val randomVerifier = appToken.gernerateVerifier
              //the user is logged in so we have the current user
              val obpUser = OBPUser.currentUser.get

              //link the token with the concrete API User
              obpUser.user.obj.map {
                u => {
                  //We want ApiUser.id because it is unique, unlike the id given by a provider
                  // i.e. two different providers can have a user with id "bob"
                  appToken.userForeignKey(u.id.get)
                }
              }
              if (appToken.save())
                verifier = randomVerifier
            } else
              verifier = appToken.verifier

            // DO NOT WANT TO BE LOGED IN, WHILE AUTHORIZING AS USER
            OBPUser.logUserOut()

            //send the user to another obp page that handles the redirect
            val oauthQueryParams: List[(String, String)] = ("oauth_token", unencodedTokenParam) :: ("oauth_verifier", verifier) :: Nil
            val redirectionUrl = Props.get("hostname", "") + OAuthWorkedThanks.menu.loc.calcDefaultHref

            if (appToken.callbackURL.is == "oob") {
              val oauthQueryParamsAdd: List[(String, String)] = oauthQueryParams :+ (BankTemplateParam, S.param(BankTemplateParam).get)
              S.redirectTo(appendParams(redirectionUrl, oauthQueryParamsAdd))
            }

            val applicationRedirectionUrl = appendParams(appToken.callbackURL, oauthQueryParams)
            val encodedApplicationRedirectionUrl = urlEncode(applicationRedirectionUrl)
            val redirectionParam = List(("redirectUrl", encodedApplicationRedirectionUrl), (BankTemplateParam, S.param(BankTemplateParam).get))
            S.redirectTo(appendParams(redirectionUrl, redirectionParam))

          } else if (shouldNotLogIn() && !isTokenVerified()) {

            // 2 STEP: TOKEN VERIFICATION
            hideFailedLoginMessageIfNeeded &
              hideFailedTokenMessageIfNeeded &
              "#applicationName" #> consumer.name &
              VerifierBlocSel #> NodeSeq.Empty &
              LoginBlocSel #> NodeSeq.Empty &
              ErrorMessageSel #> NodeSeq.Empty

          } else {

            // 1 STEP: LOGIN
            var currentUrl = S.uriAndQueryString.getOrElse("/")

            var bankTempl = S.param(BankTemplateParam).openOr("ing")
            var replacePart = bankTempl match {
              case "gringotts" => s"/oauth_gringotts"
              case "gotham" => s"/oauth_gotham"
              case _ => s"/oauth_ing"
            }

            currentUrl =  currentUrl.replace("/oauth/authorize", replacePart)
            val stripUrl = currentUrl split "\\?" head

            // DO NOT WANT TO USE ALREADY LOGED IN USER TO AUTHORIZE
            if (OBPUser.loggedIn_?) {
              OBPUser.logUserOut()
              S.redirectTo(currentUrl)
            }

            //if login succeeds, reload the page with logUserOut=false to process it
            OBPUser.loginRedirect.set(Full(Helpers.appendParams(stripUrl,
              addParamsToMap(parseUriParameters(currentUrl), List((LogUserParam, "false"), (FailedLoginParam, "false"))).filterNot(_._1.equals(BankTemplateParam)))))

            //if login fails, just reload the page with the login form visible
            OBPUser.failedLoginRedirect.set(Full(Helpers.appendParams(stripUrl,
              addParamsToMap(parseUriParameters(currentUrl),List((FailedLoginParam, "true"))).filterNot(_._1.equals(BankTemplateParam)))))
            //the user is not logged in so we show a login form
            hideFailedLoginMessageIfNeeded &
              hideFailedTokenMessageIfNeeded &
              "#applicationName" #> consumer.name &
              VerifierBlocSel #> NodeSeq.Empty &
              ErrorMessageSel #> NodeSeq.Empty &
              TokenVerifyBlocSel #> NodeSeq.Empty & {
              ".login [action]" #> OBPUser.loginPageURL &
                ".forgot [href]" #> {
                  val href = for {
                    menu <- OBPUser.resetPasswordMenuLoc
                  } yield menu.loc.calcDefaultHref

                  href getOrElse "#"
                } &
                ".signup [href]" #>
                  OBPUser.signUpPath.foldLeft("")(_ + "/" + _)
            }
          }
        }
        case _ => loginError("Application not found")
      }


    }

    //TODO: improve loginError messages
    val cssSel = for {
      tokenParam <- S.param("oauth_token") ?~! "There is no Token."
      token <- Token.find(By(Token.key, Helpers.urlDecode(tokenParam.toString)), By(Token.tokenType, TokenType.Request)) ?~! "This token does not exist"
      tokenValid <- Helper.booleanToBox(token.isValid, "Token expired")
    } yield {
      validTokenCase(token, tokenParam)
    }

    cssSel match {
      case Full(sel) => sel
      case Failure(msg, _, _) => loginError(msg)
      case _ => loginError("unknown loginError")
    }

  }

  def logOutWhenAsUser ={
    if(OBPUser.loggedIn_?) {
      OBPUser.currentUser match {
        case Full(user) => {
          val data = MappedAccountHolder.find(By(MappedAccountHolder.user, user.id))
          if(data.isDefined)
            OBPUser.logUserOut()
        }
      }
    }
    NodeSeq.Empty
  }

  //looks for expired tokens and nonces and deletes them
  def dataBaseCleaner: Unit = {
    import net.liftweb.mapper.By_<
    import net.liftweb.util.Schedule
    Schedule.schedule(dataBaseCleaner _, 1 hour)

    val currentDate = new Date()

    /*
      As in "wrong timestamp" function, 3 minutes is the timestamp limit where we accept
      requests. So this function will delete nonces which have a timestamp older than
      currentDate - 3 minutes
    */
    val timeLimit = new Date(currentDate.getTime + 180000)

    //delete expired tokens and nonces
    (Token.findAll(By_<(Token.expirationDate, currentDate)) ++ Nonce.findAll(By_<(Nonce.timestamp, timeLimit))).foreach(t => t.delete_!)
  }

  def parseUriParameters(uri: String): mutable.HashMap[String, String] = {
    val paramMap = new mutable.HashMap[String, String]()
    val parts = uri split "\\?"
    if (parts.length > 1) {
      val query = parts(1)
      query split "&" foreach { param =>
        val pair = param split "="
        pair.length match {
          case l if l > 1 => paramMap.put(URLDecoder.decode(pair(0), "UTF-8"), URLDecoder.decode(pair(1), "UTF-8"))
        }
      }
    }
    paramMap
  }

  def addParamsToMap(paramsMap: mutable.HashMap[String, String], params: Seq[(String, String)]) : Seq[(String, String)] = {
    params.foreach( param =>
      paramsMap.put(param._1, param._2)
    )
    paramsMap.toList
  }

  def authorization: CssSel = {
    "#oauth_token [value]" #> S.param("oauth_token") &
      "#token_id [value]" #> S.param(TokenIdParam).openOr("") &
      "#bankTemplate [value]" #> S.param(BankTemplateParam).openOr("ing")
  }

  def bankClass = {
    val bank = S.param(BankTemplateParam).openOr("ing");
    "#bank_id [value]" #> bank & "body [class]" #> bank;
  }
}
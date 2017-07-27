package code.snippet

import code.bankconnectors.Connector
import code.model.{Token, TokenType}
import code.model.dataAccess.OBPUser
import net.liftweb.common.Full
import net.liftweb.http.{RedirectResponse, S, SHtml}
import net.liftweb.mapper.By
import net.liftweb.util.Helpers
import net.liftweb.util.Helpers._

/**
  * Created by Michal on 27.03.2017.
  */
object TokenVerifier {

  def processSubmit = {
    var queryParams: List[(String, String)] = ("logUser", "false") :: Nil

    if (S.post_?) {
      for {
        tokenParam <- S.param("login_token") ?~! "There is no Login Token."
        tokenIdParam <- S.param("token_id") ?~! "There is no Token Id."
        bankParam <- S.param("bankTemplate") ?~! "There is no Bank template."
        oauthParam <- S.param("oauth_token") ?~! "There is no OAuth Token."
        token <- Token.find(By(Token.key, Helpers.urlDecode(oauthParam.toString)), By(Token.tokenType, TokenType.Request)) ?~! "This token does not exist"
      } yield {
        queryParams = queryParams :+ ("oauth_token", oauthParam)
//        queryParams = queryParams :+ ("bankTemplate", bankParam)
        queryParams = queryParams :+ ("token_id", tokenIdParam)
        queryParams = queryParams :+ ("token_verified", verifyToken(tokenIdParam, tokenParam, token).toString)
      }
    }

    var bankId = S.param("bankTemplate").openOr("")
    var redirectUrl = bankId match {
      case "gringotts" => s"/oauth_gringotts"
      case "gotham" => s"/oauth_gotham"
      case _ => s"/oauth_ing"
    }
    S.redirectTo(appendParams(redirectUrl,queryParams))
  }

  def render = {
    "#submit" #> SHtml.onSubmitUnit(() => processSubmit)
  }


  def verifyToken(tokenId: String, tokenToVerify: String, oauthToken: Token): Boolean ={
    checkAndProcessToken(tokenId, tokenToVerify, oauthToken)
  }

  def useToken(tokenId: String, oauthToken: Token): Boolean ={
    checkAndProcessToken(tokenId, null, oauthToken)
  }

  def checkAndProcessToken(tokenId: String, tokenToVerify: String, oauthToken: Token):Boolean = {
    Connector.connector.vend.getLoginToken(tokenId.toLong) match {
      case Full(tokenObj) => {
        val token = tokenObj.token.get
        val verified = tokenObj.verified.get
        val active = tokenObj.active.get
        val consumer_id = tokenObj.consumer_id.get
        val user_id = tokenObj.user_id.get

        val consumerId = oauthToken.consumerId.get
         val userId = OBPUser.currentUser.get.id.get

        if(tokenToVerify != null){
          // VERIFY TOKEN
          if(token.equals(tokenToVerify) && !verified && active && consumer_id.equals(consumerId) && user_id.equals(userId)) {
            Connector.connector.vend.setLoginTokenVerified(tokenId.toLong, true)
            true
          } else
            false
        } else {
          // USE TOKEN
          if(verified && active && consumer_id.equals(consumerId) && user_id.equals(userId)) {
            Connector.connector.vend.setLoginTokenActive(tokenId.toLong, false)
            true
          } else
            false
        }

      }
      case _ => false
    }
  }

  def isTokenVerified(tokenId: Long): Boolean = {
    Connector.connector.vend.getLoginToken(tokenId.toLong) match {
      case Full(tokenObj) => tokenObj.verified.get
      case _ => false
    }
  }
}

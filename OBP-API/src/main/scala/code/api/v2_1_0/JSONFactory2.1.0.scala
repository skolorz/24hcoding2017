/**
Open Bank Project - API
Copyright (C) 2011-2015, TESOBE Ltd

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

Email: contact@tesobe.com
TESOBE / Music Pictures Ltd
Osloerstrasse 16/17
Berlin 13359, Germany

  This product includes software developed at
  TESOBE (http://www.tesobe.com/)
  by
  Simon Redfern : simon AT tesobe DOT com
  Stefan Bethge : stefan AT tesobe DOT com
  Everett Sochowski : everett AT tesobe DOT com
  Ayoub Benali: ayoub AT tesobe DOT com

  */
package code.api.v2_1_0

import java.util.Date

import code.api.v1_2_1.AmountOfMoneyJSON
import code.api.v1_4_0.JSONFactory1_4_0.{TransactionRequestAccountFromJSON, TransactionRequestAccountJSON}
import code.api.v2_0_0.TransactionRequestChargeJSON
import code.model.{AmountOfMoney, BankId, Consumer}
import code.products.Products.Product
import code.transactionrequests.TransactionRequests._

case class TransactionRequestTypeJSON(transaction_request_type: String)
case class TransactionRequestTypesJSON(transaction_request_types: List[TransactionRequestTypeJSON])

//For SEPA, it need the iban to find toBankAccount
case class IbanJson (val iban : String)

trait TransactionRequestCommonBodyJSON {
  val value : AmountOfMoneyJSON
}

trait TransactionRequestDetailsJSON {
  val value : AmountOfMoneyJSON
}

case class TransactionRequestDetailsSandBoxTanJSON(
                                                    to: TransactionRequestAccountJSON,
                                                    value : AmountOfMoneyJSON,
                                                    description : String
                                                  ) extends TransactionRequestDetailsJSON

case class TransactionRequestDetailsSEPAJSON(
                                              value : AmountOfMoneyJSON,
                                              to: IbanJson,
                                              description : String,
                                              charge_policy: String
                                            ) extends TransactionRequestDetailsJSON

case class TransactionRequestDetailsFreeFormJSON(
                                                  value : AmountOfMoneyJSON
                                                ) extends TransactionRequestDetailsJSON

case class ConsumerJSON(id: Long,
                        name: String,
                        apptype: String,
                        description: String,
                        developeremail: String,
                        secret: String,
                        key: String,
                        createdat: Date,
                        updatedat: Date,
                        userauthenticationurl: String,
                        isActive: Boolean
                       )

case class ConsumerJSONs(list: List[ConsumerJSON])


//V210 added details and description fields
case class ProductJson(code : String,
                       name : String,
                       bankId : BankId,
                       category: String,
                       family : String,
                       super_family : String,
                       more_info_url: String
                      )
case class ProductsJson (products : List[ProductJson])


case class TransactionRequestWithChargeJSON210Wrapper(
                                                id: String,
                                                `type`: String,
                                                from: TransactionRequestAccountFromJSON,
                                                details: String,
                                                transaction_ids: String,
                                                status: String,
                                                start_date: Date,
                                                end_date: Date,
                                                need_challenge: Boolean,
                                                charge : TransactionRequestChargeJSON
                                              )


case class TransactionRequestWithChargeJSONs210Wrapper(
                                                 transaction_requests_with_charges : List[TransactionRequestWithChargeJSON210Wrapper]
                                               )

object JSONFactory210{
  def createTransactionRequestTypeJSON(transactionRequestType : String ) : TransactionRequestTypeJSON = {
    new TransactionRequestTypeJSON(
      transactionRequestType
    )
  }

  // V210 Products
  def createProductJson(product: Product) : ProductJson = {
    ProductJson(product.code.value,
      product.name,
      product.bankId,
      product.category,
      product.family,
      product.superFamily,
      product.moreInfoUrl)
  }

  def createTransactionRequestTypeJSON(transactionRequestTypes : List[String]) : TransactionRequestTypesJSON = {
    TransactionRequestTypesJSON(transactionRequestTypes.map(createTransactionRequestTypeJSON))
  }

  //transaction requests
  def getTransactionRequestDetailsSandBoxTanFromJson(details: TransactionRequestDetailsSandBoxTanJSON) : TransactionRequestDetailsSandBoxTan = {
    val toAcc = TransactionRequestAccount (
      bank_id = details.to.bank_id,
      account_id = details.to.account_id,
      iban = details.to.iban
    )
    val amount = AmountOfMoney (
      currency = details.value.currency,
      amount = details.value.amount
    )

    TransactionRequestDetailsSandBoxTan (
      to = toAcc,
      value = amount,
      description = details.description
    )
  }

  def getTransactionRequestDetailsSEPAFromJson(details: TransactionRequestDetailsSEPAJSON) : TransactionRequestDetailsSEPA = {
    val amount = AmountOfMoney (
      currency = details.value.currency,
      amount = details.value.amount
    )

    TransactionRequestDetailsSEPA (
      value = amount,
      description = details.description
    )
  }

  def getTransactionRequestDetailsFreeFormFromJson(details: TransactionRequestDetailsFreeFormJSON) : TransactionRequestDetailsFreeForm = {
    val amount = AmountOfMoney (
      currency = details.value.currency,
      amount = details.value.amount
    )

    TransactionRequestDetailsFreeForm (
      value = amount,
      description = ""
    )
  }

  /** Creates v2.1.0 representation of a TransactionType
    *
    * @param tr An internal TransactionRequest instance
    * @return a v2.1.0 representation of a TransactionRequest
    */

  def createTransactionRequestWithChargeJSON(tr : TransactionRequest) : TransactionRequestWithChargeJSON210Wrapper = {
    new TransactionRequestWithChargeJSON210Wrapper(
      id = tr.id.value,
      `type` = tr.`type`,
      from = TransactionRequestAccountFromJSON (
        bank_id = tr.from.bank_id,
        account_id = tr.from.account_id
      ),
      details = tr.body.description,
      transaction_ids = tr.transaction_ids,
      status = tr.status,
      start_date = tr.start_date,
      end_date = tr.end_date,
      // Some (mapped) data might not have the challenge. TODO Make this nicer
      need_challenge = tr.challenge != null
      /*{
        try {ChallengeJSON (id = tr.challenge.id, allowed_attempts = tr.challenge.allowed_attempts, challenge_type = tr.challenge.challenge_type)}
        // catch { case _ : Throwable => ChallengeJSON (id = "", allowed_attempts = 0, challenge_type = "")}
        catch { case _ : Throwable => null}
      }*/,
      charge = TransactionRequestChargeJSON (summary = tr.charge.summary,
        value = AmountOfMoneyJSON(currency = tr.charge.value.currency,
          amount = tr.charge.value.amount)
      )
    )
  }

  def createTransactionRequestJSONs(trs : List[TransactionRequest]) : TransactionRequestWithChargeJSONs210Wrapper = {
    TransactionRequestWithChargeJSONs210Wrapper(trs.map(createTransactionRequestWithChargeJSON))
  }

  def createConsumerJSON(c: Consumer): ConsumerJSON = {
    ConsumerJSON(id = c.id,
      name = c.name,
      apptype = c.appType.toString(),
      description = c.description,
      developeremail = c.developerEmail,
      isActive = c.isActive,
      createdat = c.createdAt,
      secret = c.secret,
      key = c.key,
      updatedat = c.updatedAt,
      userauthenticationurl = c.userAuthenticationURL

    )


  }

  def createConsumerJSONs(l : List[Consumer]): ConsumerJSONs = {
    ConsumerJSONs(l.map(createConsumerJSON))
  }
}
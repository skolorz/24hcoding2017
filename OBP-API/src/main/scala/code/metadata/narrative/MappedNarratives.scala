package code.metadata.narrative

import code.model.{TransactionId, AccountId, BankId}
import code.util.DefaultStringField
import net.liftweb.common.Full
import net.liftweb.mapper._

object MappedNarratives extends Narrative {

  private def getMappedNarrative(bankId: BankId, accountId: AccountId, transactionId: TransactionId) = {
    MappedNarrative.find(By(MappedNarrative.bank, bankId.value),
      By(MappedNarrative.account, accountId.value),
      By(MappedNarrative.transaction, transactionId.value))
  }

  override def getNarrative(bankId: BankId, accountId: AccountId, transactionId: TransactionId)(): String = {
    val found = getMappedNarrative(bankId: BankId, accountId: AccountId, transactionId: TransactionId)

    found.map(_.narrative.get).getOrElse("")
  }

  override def setNarrative(bankId: BankId, accountId: AccountId, transactionId: TransactionId)(narrative: String): Unit = {

    val existing = getMappedNarrative(bankId: BankId, accountId: AccountId, transactionId: TransactionId)

    if(narrative.isEmpty) {
      //if the new narrative is empty, we can just delete the existing one
      existing.foreach(_.delete_!)
    } else {
      val mappedNarrative = existing match {
        case Full(n) => n
        case _ => MappedNarrative.create
          .bank(bankId.value)
          .account(accountId.value)
          .transaction(transactionId.value)
      }
      mappedNarrative.narrative(narrative).save
    }
  }
}

class MappedNarrative extends LongKeyedMapper[MappedNarrative] with IdPK with CreatedUpdated {
  def getSingleton = MappedNarrative

  object bank extends MappedString(this, 255)
  object account extends MappedString(this, 255)
  object transaction extends MappedString(this, 255)

  object narrative extends DefaultStringField(this)
}

object MappedNarrative extends MappedNarrative with LongKeyedMetaMapper[MappedNarrative] {
  override def dbIndexes = Index(bank, account, transaction) :: super.dbIndexes
}
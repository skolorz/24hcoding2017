package code.logintoken


import java.util.Date

import code.util.DefaultStringField
import net.liftweb.common.Logger
import net.liftweb.mapper._

class LoginToken extends LongKeyedMapper[LoginToken] with IdPK with CreatedTrait {

  private val logger = Logger(classOf[LoginToken])

  override def getSingleton = LoginToken

  object user_id extends MappedLong(this)

  object consumer_id extends MappedLong(this)

  object verified extends MappedBoolean(this)

  object active extends MappedBoolean(this)

  object token extends DefaultStringField(this)


  def toLoginToken : Option[LoginTokenCase] = {
    Some(
      LoginTokenCase(
        id = id.get,
        user_id = user_id.get,
        consumer_id = consumer_id.get,
        token = token,
        verified = verified,
        active = verified,
        createdat = createdAt
      )
    )
  }
}

object LoginToken extends LoginToken with LongKeyedMetaMapper[LoginToken] {
  override def dbIndexes = UniqueIndex(id) :: super.dbIndexes
}

case class LoginTokenCase(id : Long,
                          user_id : Long,
                          consumer_id: Long,
                          token: String,
                          verified: Boolean,
                          active: Boolean,
                          createdat: Date
                      )
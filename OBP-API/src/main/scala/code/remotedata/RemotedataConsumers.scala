package code.remotedata

import code.consumer.{ConsumersProvider, RemotedataConsumersCaseClasses}
import code.model.AppType.AppType
import code.model._
import net.liftweb.common._


object RemotedataConsumers extends ConsumersProvider {

  val cc = RemotedataConsumersCaseClasses

  override def getConsumerByConsumerId(consumerId: Long): Box[Consumer] = ???

  override def getConsumerByConsumerKey(consumerKey: String): Box[Consumer] = ???

  override def createConsumer(key: Option[String], secret: Option[String], isActive: Option[Boolean], name: Option[String], appType: Option[AppType], description: Option[String], developerEmail: Option[String], redirectURL: Option[String], createdByUserId: Option[String]): Box[Consumer] = ???

  override def updateConsumer(consumerId: Long, key: Option[String], secret: Option[String], isActive: Option[Boolean], name: Option[String], appType: Option[AppType], description: Option[String], developerEmail: Option[String], redirectURL: Option[String], createdByUserId: Option[String]): Box[Consumer] = ???
}

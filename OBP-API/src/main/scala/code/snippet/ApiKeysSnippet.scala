package code.snippet

import code.model.Consumer
import code.model.dataAccess.OBPUser
import net.liftweb.common.Loggable
import net.liftweb.mapper.By
import net.liftweb.util.Helpers._

import scala.xml.NodeSeq

/**
  * Created by Lukasz on 13.03.2017.
  */
class ApiKeysSnippet extends Loggable{

  def showForUser = {
    def values = Consumer.findAll(By(Consumer.apiUserId, OBPUser.currentUserId.openOrThrowException("Invalid user id")))
    "tbody tr *" #> values.map(consumer => {
      ".data" #> <td>{consumer.name}</td><td>{consumer.key}</td><td>{consumer.secret}</td>
    })}

}

package code.snippet

import code.model.dataAccess.{OBPUser, ViewPrivileges}
import net.liftweb.common.Loggable
import net.liftweb.mapper.By
import net.liftweb.util.Helpers._

/**
  * Created by Lukasz on 16.03.2017.
  */
class EntitlementSnippet extends Loggable{

  /**
  def showEntitlements = {
    val viewPrivilages = ViewPrivileges.findAll(By(ViewPrivileges.user, OBPUser.id))
    "tbody tr *" #> viewPrivilages.map(viewPrivilage => {
      ".data" #>
    })
  }
    **/
}

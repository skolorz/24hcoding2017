package code.api.v2_0_0

import code.api.ServerSetupWithTestData

trait V200ServerSetup extends ServerSetupWithTestData {

  def v1_4Request = baseRequest / "obp" / "v1.4.0"
  def v2_1Request = baseRequest / "obp" / "v2.1.0"

}
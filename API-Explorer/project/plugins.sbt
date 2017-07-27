resolvers += Classpaths.typesafeResolver

// addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse" % "1.5.0")

// resolvers += "sbt-deploy-repo" at "http://reaktor.github.com/sbt-deploy/maven"
// addSbtPlugin("fi.reaktor" %% "sbt-deploy" % "0.3.1-SNAPSHOT")


//xsbt-web-plugin
addSbtPlugin("com.earldouglas" % "xsbt-web-plugin" % "2.1.0") 

//resolvers += "Web plugin repo" at "http://siasia.github.com/maven2"
//libraryDependencies <+= sbtVersion(v => v match {
//case "0.11.0" => "com.github.siasia" %% "xsbt-web-plugin" % "0.11.0-0.2.8"
//case "0.11.1" => "com.github.siasia" %% "xsbt-web-plugin" % "0.11.1-0.2.10"
//case "0.11.2" => "com.github.siasia" %% "xsbt-web-plugin" % "0.11.2-0.2.11"
//case "0.11.3" => "com.github.siasia" %% "xsbt-web-plugin" % "0.11.3-0.2.11.1"
//})

//sbteclipse
resolvers += {
  val typesafeRepoUrl = new java.net.URL("http://repo.typesafe.com/typesafe/releases")
  val pattern = Patterns(false, "[organisation]/[module]/[sbtversion]/[revision]/[type]s/[module](-[classifier])-[revision].[ext]")
  Resolver.url("Typesafe Repository", typesafeRepoUrl)(pattern)
}

addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "4.0.0")
addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.8.2")

//sbt-idea
resolvers += "sbt-idea-repo" at "http://mpeltonen.github.com/maven/"

addSbtPlugin("com.github.mpeltonen" % "sbt-idea" % "1.6.0")

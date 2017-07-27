package pl.lczyrny.password;

import org.apache.commons.cli.*;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import pl.lczyrny.password.util.BCrypt;
import pl.lczyrny.password.util.StringHelper;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Optional;

public class Application {

    private static String SEPARATOR = "\n";

    public static void main(String[] args) {
        Options options = new Options();
        options.addRequiredOption("h", "host", true, "API Hostname");
        options.addOption("p","password",true,"Password to hash");
        options.addOption("s", "salt", true, "Bcrypt salt");
        options.addOption("g", "generate-script-file", true, "Generate script and write it to file");

        CommandLineParser commandLineParser = new DefaultParser();

        try {
            CommandLine cmd = commandLineParser.parse(options, args);

            Boolean definedPass = cmd.hasOption("p");
            String pass = (definedPass) ? cmd.getOptionValue("p") : StringHelper.randomString(14);
            Optional<String> bCryptSalt = Optional.ofNullable(cmd.getOptionValue("s"));

            String bcrypted = BCrypt.hashpw(
                    pass,
                    (bCryptSalt.isPresent()) ? BCrypt.gensalt(Integer.parseInt(bCryptSalt.get())) : BCrypt.gensalt()
            );

            PrintStream consolePrint = new PrintStream(System.out);

            final String generatedPass = "b;" + bcrypted.substring(0, 44);
            final String generatedSalt = bcrypted.substring(44);
            if(!definedPass)
                consolePrint.println(pass);
            consolePrint.println(generatedPass + SEPARATOR  + generatedSalt);

            if(!cmd.hasOption("g"))
                return;

            //File prepare
            String filename = FilenameUtils.normalize(cmd.getOptionValue("g"));

            String sb = "#!/bin/bash" + SEPARATOR +
                    "echo export API_HOST=\"" + cmd.getOptionValue("h") + "\"" + SEPARATOR +
                    "echo export USER_PASS=\"" + StringHelper.escapeBashChars(generatedPass) + "\"" + SEPARATOR +
                    "echo export USER_SALT=\"" + generatedSalt + "\"" + SEPARATOR;

            File file = new File(filename);
            if(file.exists())
                file.delete();
            FileUtils.writeStringToFile(file, sb, Charset.forName("UTF-8"));

        } catch (ParseException e) {
            HelpFormatter helpFormatter = new HelpFormatter();
            helpFormatter.printHelp("passgen", options);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

package uk.nominet.apitest;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Properties;

public class ConfigProperties {
    private static String authToken;

    static {
        Properties prop = new Properties();
        try (InputStream input = Files.newInputStream(Path.of("app.test.properties"))) {
            prop.load(input);
            authToken = prop.getProperty("github_token");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static String getAuthToken() {
        return authToken;
    }
}


import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

import org.mindrot.jbcrypt.BCrypt;

import com.project.lms.util.DBConnect;

public class App {

	public static void main(String[] args) {
		try (Connection conn = DBConnect.getInstance().getConnection()) {
            if (conn != null) {
                System.out.println("✅ Database Connection Successful!");
            } else {
                System.out.println("❌ Database Connection Failed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Test password hashing
        String password = "SecurePass123";
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        System.out.println("🔒 Original Password: " + password);
        System.out.println("🔑 Hashed Password: " + hashedPassword);

        // Test password verification
        boolean isMatch = BCrypt.checkpw(password, hashedPassword);
        System.out.println("🟢 Password Match: " + isMatch);
        Scanner sc = new Scanner(System.in);
        String str = sc.nextLine();
        int x = Integer.parseInt(sc.nextLine());
        
	}

}

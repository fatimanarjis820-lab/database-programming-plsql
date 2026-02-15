import java.sql.*;
public class DebitTransactionEx {
    public static void main(String[] args){
        try{
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "fatima");
            
            CallableStatement callable = connection.prepareCall("{call DEBIT_TRANSACTION(?, ?)}");
            callable.setInt(1, 123);
            callable.setInt(2, 200);
            callable.execute();
            callable.close();
            connection.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

/**
 *
 * @author Monster
 */
public class Validateor {
 public boolean emailValidate(String email) {
    	
    	boolean emailValidate=false;
    	
        try {
            String emailregex = "^[_A-Za-z0-9-]+@[A-Za-z]+\\.[A-Za-z0-9-]{2,3}+(\\.[A-Za-z]{2,3})*$";
            emailValidate = email.matches(emailregex);
            System.out.println(email+"=================="+emailValidate);
            
            }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return emailValidate;
    }
 
}

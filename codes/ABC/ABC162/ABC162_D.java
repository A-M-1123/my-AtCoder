import java.util.*; 

public class Main {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    char[] c = new char[n];
    String s = sc.next();
    c = s.toCharArray();
    
    char[] cln = {'R', 'G', 'B'};
    HashMap<Character, Integer> cl = new HashMap<>();
    for(int i = 0; i < 3; i++) {
      cl.put(cln[i], i);
    }
    
    int ar[][] = new int[n][3];
    for(int i = 0; i < n; i++) {
      for(int j = 0; j < 3; j++) {
        ar[i][j] = 0;
      }
    }
    for(int i = 0; i < n-1; i++) {
      for(int j = i+1; j < n; j++) {
        ar[i][cl.get(c[j])] += 1;
      }
    }
    
    long sum = 0;
    for(int i = 0; i < n-1; i++) {
      for(int j = i+1; j < n; j++) {
        if(c[i] != c[j]) {
          int id = 3;
          id -= cl.get(c[i]);
          id -= cl.get(c[j]);
          sum += ar[j][id];
          if(j+j-i < n && c[j+j-i] == cln[id]) sum -= 1;
        }
      }
    }
    System.out.println(sum);
  }
}
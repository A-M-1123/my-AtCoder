import java.util.*; 

public class Main {
  static int n;
  static int[] a, ans;
  static Queue<Integer>[] tr;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    n = sc.nextInt();
    a = new int[n];
    for(int i = 0; i < n; i++) {
      a[i] = sc.nextInt();
    }
    
    tr = new ArrayDeque[n+1];
    for(int i = 0; i <= n; i++) {
      tr[i] = new ArrayDeque<>();
    }
    for(int i = 0; i < n-1; i++) {
      int u = sc.nextInt();
      int v = sc.nextInt();
      tr[u].add(v);
      tr[v].add(u);
    }

    ans = new int[n+1];
    int[] lis = new int[n];
    ans[1] = 1;
    lis[0] = a[0];
    tr[1].forEach(chi -> dfs(chi, 1, lis, 1));
    
    for(int i = 1; i <= n; i++) {
      System.out.println(ans[i]);
    }
    sc.close();
  }

  private static void dfs(int id, int pa, int[] lis, int ln) {
    if(lis[ln-1] < a[id-1]) {
      lis[ln] = a[id-1];
      ln += 1;
    } else if(a[id-1] < lis[0]) {
      lis[0] = a[id-1];
    } else {
      lis[bins(lis, a[id-1], 0, ln-1)] = a[id-1];
    }
    
    ans[id] = ln;
    
    if(tr[id].size() == 1) {
      return;
    } else {
      for(int chi : tr[id]) {
        if(chi != pa) dfs(chi, id, lis, ln);
      }
    }
  }

  private static int bins(int[] ar, int num, int st, int en) {
    int mid = (st+en)/2;
    if((ar[max(mid-1, 0)] <= num && num <= ar[mid]) || st == en) {
      return mid;
    } else {
      if(num < ar[mid]) {
        return bins(ar, num, st, mid-1);
      } else {
        return bins(ar, num, mid+1, en);
      }
    }
  }

  public static int max(int n1, int n2) {
    if(n1 > n2) return n1;
    return n2;
  }
}
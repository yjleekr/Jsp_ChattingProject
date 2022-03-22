package dto;

import java.util.Arrays;
import java.util.Scanner;
import java.util.Stack;

public class ssamp {
	


    public static void abc (){
        Scanner scanner = new Scanner(System.in);
        // 숫자 입력받음
        int num = scanner.nextInt();
        // 결과 넣을 배열
        String[] result = new String[num];
        // 숫자만큼 돌리고
        for(int i=0; i<num; i++){
            // 문자열 입력 받고
            String PS = scanner.next();
            // 스택 생성
            Stack<String> strings = new Stack<>();
            // 입력 받은 문자열 쪼개서 스택에 저장
            for(int j=0; j<PS.length(); j++){
                strings.push(PS.substring(j,j+1));
            }
            int zxc = PS.length();
            boolean found = true;

                for(int j=0; j<zxc-1; j++){
                    System.out.println(strings.toString());
                    System.out.println("j :"+j);
                    System.out.println("string :"+strings.get(j)+strings.get(j+1));
                    if((strings.get(j)+strings.get(j+1)).equals("()")){
                        strings.remove(j);
                        strings.remove(j+i);
                        zxc -= 2;
                        j=-1;
                    }
                }
                System.out.println("zxc :"+zxc);

                if(zxc==0){
                    for(int j=0; j<result.length; j++){
                        if(result[j]==null){
                            result[j]="YES";
                            break;
                        }
                    }

                }else{
                    for(int j=0; j<result.length; j++){
                        if(result[j]==null){
                            result[j]="NO";
                            break;
                        }
                    }
                }
            System.out.println(Arrays.toString(result));
        }


    }

    public static void main(String[] args) {
        abc();
    }

}

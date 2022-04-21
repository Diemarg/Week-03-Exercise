use std::io;

fn main() {

    //TODO: modularize code with functions
    let stdin = io::stdin();
    let printers = 3;

    //Read number of test cases
    let mut test_cases = String::new();
    stdin.read_line(&mut test_cases).unwrap();
    let test_cases: u32 = test_cases.trim().parse().unwrap();

    //Cycle through each case
    let mut case = String::new();
    for t in 0..test_cases {
        //Get minimum ink level for each color
        let mut i = 0;
        let mut min_ink: [u32;4]= [9999999,9999999,9999999,9999999];
        while i<printers{
            stdin.read_line(&mut case).unwrap();
            let ink: Vec<u32> = case.split_whitespace()
                                    .map(|x| x.parse::<u32>().unwrap())
                                    .collect();
            case.clear();
            i = i+1;
            for j in 0..4{
                if min_ink[j]>ink[j]{
                    min_ink[j]=ink[j];
                }
            }
        }

        //Get the necessary ink level for each cartridge
        //TODO: use recursion or loop&stacks to simplify code, bruteforced the logic
        let mut result = String::new();
        let sum: u32 = min_ink.iter().sum();
        if sum <1000000{
            result = format!("Case #{}: IMPOSSIBLE",t+1);
        }else{
            let mut ink_sum = min_ink[1]+min_ink[2]+min_ink[3];
            if ink_sum>1000000{
                min_ink[0]=0;
                ink_sum = min_ink[2]+min_ink[3];
                if ink_sum>1000000{
                    min_ink[1]=0;
                    ink_sum = min_ink[3];
                    if ink_sum>1000000{
                        min_ink[2]=0;
                    }
                    else{
                        min_ink[2]=1000000-ink_sum;
                    }
                }
                else{
                    min_ink[1]=1000000-ink_sum;
                }
            }
            else{
                min_ink[0] = 1000000 - ink_sum;
            }
            result = format!("Case #{}: {} {} {} {}",t+1,min_ink[0],min_ink[1],min_ink[2],min_ink[3]);
        }
        //Print results
        println!("{}",result);
    }
}
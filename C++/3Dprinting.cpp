#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main () {
    int t;
    int unidadesMaximas = 1000000;
    cin>>t;
    for(int x=0;x<t;x++){
        cout << "Case #"<<x+1<<": ";
        int c,m,y,k = 0;
        vector<int> cyan;
        vector<int> magenta;
        vector<int> yellow;
        vector<int> black;
        for(int p=0;p<3;p++){
            cin >> c >> m >> y >> k;
            cyan.push_back(c);
            magenta.push_back(m);
            yellow.push_back(y);
            black.push_back(k);
        }
        int minCyan = *std::min_element(cyan.begin(),cyan.end());
        int minMagenta = *std::min_element(magenta.begin(),magenta.end());
        int minYellow = *std::min_element(yellow.begin(),yellow.end());
        int minBlack = *std::min_element(black.begin(),black.end());
        int sumMins = minCyan + minMagenta + minYellow + minBlack;
        if(sumMins == unidadesMaximas){
            cout<<minCyan<<" "<<minMagenta<<" "<<minYellow<<" "<<minBlack<<endl;
        }else if(sumMins < unidadesMaximas){
            cout<<"IMPOSSIBLE"<<endl;
        }else{
            int minimos[4] = {minCyan,minMagenta,minYellow,minBlack};
            for(int i=0;i<4;i++){
                sumMins = 0;
                for(int j=i+1;j<4;j++) {
                    sumMins+=minimos[j];
                }
                if (sumMins >= unidadesMaximas) {
                    minimos[i] = 0;
                }
                else {
                    minimos[i]=unidadesMaximas-sumMins;
                    break;
                }
            } cout <<minimos[0]<<" "<<minimos[1]<<" "<<minimos[2]<<" "<<minimos[3]<<endl;
        }
    }
    return 0;
}
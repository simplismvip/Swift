//
//  main.swift
//  Distance-choose
//
//  Created by JM Zhao on 2017/5/5.
//  Copyright © 2017年 JunMing. All rights reserved.
//

import Foundation

var tempArray = Array(repeating: 0, count: 100)
var shoppingLIst:[String] = ["d", "d", "d"]

var numbers:Array = [Int]()
for n in 1...100 {

    numbers.append(n)
}

//print(numbers)
func filterNumberByDistance(distance: Int, source: Array<Int>) -> Array<Int> {

    var newSources = [Int]();
    for n in source {

        if source.count < 1 {

            return source;
            
        }else {
            for m in n..<source.count {

                let ele = source[m]
                if abs(ele - n) < distance {

                    print(ele)
                    break
                    // newSources.remove(at: m)
                }
            }
        }
    }
    
    return newSources;
}

let arr = filterNumberByDistance(distance: 5, source: numbers)
// print(arr)

















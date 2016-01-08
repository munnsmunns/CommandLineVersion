//
//  main.swift
//  Quiz Bowl Test
//
//  Created by MUNNS, MATTHEW on 12/11/15.
//  Copyright © 2015 MUNNS, MATTHEW. All rights reserved.
//

import Foundation

var scores = [[Int]](count: 2, repeatedValue: [Int](count: 60, repeatedValue: 0) )

var round = 1

let WIN = 10, BONUS = 5

//find the sum of a teams score. first team == 0 second team == 1.
func teamScore(scores: [[Int]], team: Int) -> Int {
    var sum = 0
    //add up sum
    for score in scores[team] {
        sum += score
    }
    return sum
}

func winRound(var scores: [[Int]], team: Int, round: Int, gotBonus: Bool) -> [[Int]] {
    //apply bonus if necessary
    var extra = 0
    
    if gotBonus {
        extra = BONUS
    }
    scores[team][round] = WIN + extra
    
    return scores
}

func nextInt() -> Int
{
    let stdin = NSFileHandle.fileHandleWithStandardInput()
    let data: NSData = stdin.availableData
    let str = NSString(data: data, encoding: NSUTF8StringEncoding)
    let value = str!.intValue
    return Int(value)
}

while(true)
{
    print("\nRound ", String(round))
    print("Enter which team was correct. Enter 0 if neither was correct. Enter a negative to end")
    var team = nextInt()
    var gotBonus = false
    
    switch team {
    case 1:
        print("Bonus? 0 means yes")
        let char = nextInt()
        if char == 0 {
            gotBonus = true
        }
        scores = winRound(scores, team: 0, round: round, gotBonus: gotBonus)
        
    case 2:
        print("Bonus? 0 means yes")
        let char = nextInt()
        if char == 0 {
            gotBonus = true
        }

        scores = winRound(scores, team: 1, round: round, gotBonus: gotBonus)
    default:
        break
    }
    
    if team < 0 {
        break
    }
    
    let team1Total = teamScore(scores, team: 0)
    let team2Total = teamScore(scores, team: 1)
    
    print("Team 1: ", String(team1Total), "\nTeam 2: ", String(team2Total))
    
    round++
}
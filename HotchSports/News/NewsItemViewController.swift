//
//  NewsItemViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 11/15/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit

class NewsItemViewController: UIViewController {

    @IBOutlet weak var lblNewsHead: UILabel!
    @IBOutlet weak var txtViewNewsText: UITextView!
    
    var myURLString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = myURLString {
            if url == "https://www.hotchkiss.org/athletics/news-post/~post/petersen-22-places-second-at-singlehanded-nationals-20181029" {
                lblNewsHead.text = "Petersen '22 Places Second at Singlehanded Nationals"
                txtViewNewsText.text = "Chapman Petersen ’22 followed his recent win at New Englands with a runner-up finish at the Cressy National Championship in the Laser Radial class.\n\nOne of only two freshmen in a field crowded with juniors and seniors, Petersen turned in a most impressive performance, finishing just six points behind the champion from Ranney School (NJ), and nearly 25 points clear of the rest of the field.\n\nThe Cressy regatta was a fleet race event held in Mactawa, MI over the weekend of Oct. 27-28. The two-day event included 14 separate races, in which each sailor earned points based on their position in each race, with the low overall score capturing the title.\n\nAfter starting off with a 12th-place finish in his first race, Petersen roared back with the first of his four wins on the day to climb into a tie for fifth place. Three more top-five finishes in the next four races would follow, and his win in the seventh race would vault him up into second place, where he remained for the rest of the event.\n\nPetersen finished in the top ten in each of the last seven races, including wins in the 10th and 13th races."
            } else if url == "https://www.hotchkiss.org/athletics/news-post/~post/sidamon-eristoff-19-powers-boys-cross-country-past-choate-20181022" {
                lblNewsHead.text = "Sidamon-Eristoff '19 Powers Boys Cross Country Past Choate"
                txtViewNewsText.text = "It was a day of exceptional achievement for co-captain Andrew Sidamon-Eristoff ’19 and the boys cross country team, who scored a convincing 19-41 victory over Choate on Parents Weekend.\n\nSidamon-Eristoff smashed his own Hotchkiss course record by five seconds with a new best time of 16:22 as the team recorded just the eighth dual-meet victory over the Wild Boars since 1980 and the most decisive under head coach Pierre Yoo.\n\nThe JV team also cruised to a 15-48 victory in its race, and both teams secured undefeated Founders League seasons.\n\nYoo wrote the following recaps for each race (edited slightly):\n\nVarsity\nIn front of an energetic crowd during Parents Weekend, there were great times for Hotchkiss cross country.  Five of the seven varsity runners ran to home best times on this incredible day to run. Our new runners, Huck Whittemore ’22 and Aidan Rodgers ’21, lowered their fastest time on our course by 18 seconds and 34 seconds.  Each member contributed to our first team victory against Choate since 2014. On this day, The Bearcats placed first (Sidamon-Eristoff), third (Michael Duncan ’19), fourth (Kostia Howard ’20), fifth (Whittemore), and sixth (Rodgers) to secure the victory.\n\nJunior Varsity\nIn the combined race, the junior varsity team seized the top five places and earned the victory against Choate by the score of 15 to 48.  Ed Guo ’19 continued to show incredible resolve and was the first finisher with a time of 18:22 and finished in front of the fourth Choate varsity runner.  The Bearcat pod of Nico Petersik ’21, Jack Johnson ’22 (fastest home time by 50 seconds), co-captain Ian Gill ’19, and co-captain Souleman Toure ’19 took the next scoring places for the race and contributed to a wonderful day.  Fourteen out of the 28 runners who have run the course previously earned personal best time on our home course. Billy Meneses ’22, Max Lindner ’22, and Isaac Tandatnick ’22 improved by 1:15, 2:43, and 2:45 respectively from the first time they ran the course two weeks ago. Reece Yang ’21 and Nick Romero ’21 both improved their home time by 1:06. Charles Villalba ’19 saved his best home race for last by running his fastest time since his lower mid year by 56 seconds. Others who set home bests were James Horrocks ’19 (18 seconds), Tucker Briglin ’20 (19 seconds), Alex Kovitch ’21 (22 seconds), Harry Li ’20 (22 seconds), Desmond Teague ’20 (30 seconds), and Felix Bao ’21 (33 seconds). With the decisive victory, the J.V. Bearcats completed their dual meet record at 9-0 with great times.\n\nPierre Yoo contributed to this story."
            } else if url == "https://www.hotchkiss.org/athletics/news-post/~post/girls-soccer-draws-with-choate-in-prime-time-20181021" {
                lblNewsHead.text = "Girls Soccer Draws With Choate in Prime Time"
                txtViewNewsText.text = "The girls varsity soccer team was selected for the Friday night game of Parents Weekend against Choate and did not disappoint, battling to a highly entertaining 1-1 draw on Oct. 19.\n\nThe two teams combined for 75 minutes of tense, scoreless soccer before unleashing a pair of goals in the final five minutes to send both sides home with a share of the spoils.\n\nMidfielder Louisa Essuman ’20 appeared to have the game winner for Hotchkiss (6-1-3) at 75’ when she received a free kick by Delaney Hayes ’20 from midfield and powered the ball past the Choate goalkeeper into the corner of the net for a 1-0 lead.\n\nBut the Wild Boars countered just three minutes later with their own midfield set piece. Receiving a free kick just inside the halfway line, the Choate attacker launched a high, arcing ball that made it through traffic in the box and into the net for the equalizer.\n\nIt was perhaps a fitting end to a chilly evening that saw intense, spirited play from both sides, who combined for 28 total shots, 16 of which were on target, as well as 18 total fouls.\n\nHotchkiss goalkeeper Gillian Duquette ’19 played a brilliant game in net, turning away eight Choate shots, including multiple breakaway attempts by the visitors.\n\nOn the attack, striker Hyla Mosher ’19 and left midfielder GiGi Day ’22 applied continuous pressure with through balls and attacks up the flank. The trio of Mosher, Day, and Essuman led all Bearcats with two shots on goal each and ten shots overall.\n\nChoate deployed a relentless attack of their own, and the Hotchkiss defensive line, particularly fullbacks Theresa Yu ’19 and Jillian Mazzocca ’19, chased down several Choate attackers to regain possession and restart the offense for the Bearcats.\n\nIt was a day where the starters would need to dig deep for extra energy. Eleven Bearcats played for at least 60 minutes, including Duquette, Mazzocca, Yu, Mosher, Essuman, and Day, as well as defenders Britney Burns ’20 and Sophie Rivest ’19 and midfielders Katya Giffenig ’19, Sadie Gould ’20, and Sofia Weber ’20.\n\nThe first half saw both teams pressing with an up-tempo, attacking style. Each team had excellent chances, but would see their shots sail just wide of the net. Duquette made an amazing save at 11’ against a Choate attacker with a wide-open breakaway. At the whistle, the two teams were nearly dead-even, each with four shots on goal and two corners.\n\nAfter halftime, the Bearcats came out with renewed intensity, pushing the ball upfield and generating numerous good scoring chances. Choate slowly clawed back the momentum until the two teams were once again trading possessions and scoring opportunities, setting up the wild final five minutes."
                
            } else if url == "https://www.hotchkiss.org/athletics/news-post/~post/jennings-15-named-mop-middlebury-repeats-as-ncaa-champs-20181118" {
                lblNewsHead.text = "Jennings '15 Named MOP, Middlebury Repeats"
                txtViewNewsText.text = "Grace Jennings '15 ended her collegiate field hockey career at the highest possible summit, earning NCAA Most Outstanding Player honors as the Panthers rolled to their second straight NCAA Division III field hockey title.\n\nThe Panthers downed #4 Tufts for the third time this season with another shutout, a school-record 11th on the season. This 2-0 blanking was the exclamation point on a dominating tournament run that saw the team outscore its four opponents by a total of 19-3.\n\nFor Jennings, it is her third NCAA title in four years (2015, 2017, 2018) and caps a stellar season that saw the school finish with a record of 21-1, a new all-time mark for victories. The team also captured the NESCAC title earlier this season. In addition to her MOP award in the tournament, Jennings earned first-team All-NESCAC honors earlier this month.\n\nShe concludes her four years at Middlebury with 43 goals and 46 assists, which place her second all-time on the school's career assists total.\n\nAt Hotchkiss, Jennings earned varsity letters all four years in both field hockey and ice hockey, serving as captain of both teams her senior year. She also earned the Neil H. Scott Field Hockey Prize as a lower mid, and the Carole S. Hawley '75 Award and Melissa Goss Simonds '79 Hockey Award as a senior."
            }
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

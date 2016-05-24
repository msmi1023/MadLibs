//
//  ViewController.m
//  MadLibs
//
//  Created by tstone10 on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nounField;
@property (weak, nonatomic) IBOutlet UITextField *verbField;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;

@end

@implementation ViewController
NSString *noun, *verb, *output;

NSArray *sentences;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	//typing in dictionary values?
	
	//this is javascripty! probably not the best convention here.
	sentences = @[@{@"sentence":@"The %@ walked into the house and didn't %@ anything.",
					@"nounFirst":@"1"},
				  @{@"sentence":@"The dog took his %@ and the neighbor %@ed",
					@"nounFirst":@"1"},
				  @{@"sentence":@"He %@ed and found a %@",
					@"nounFirst":@"0"}];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonPressed:(id)sender {
	//check that the user actually put stuff in
	
	noun = _nounField.text;
	verb = _verbField.text;
	
	output = [self generateOutput:noun verb:verb];
	
	_outputTextView.text = output;
}

- (NSString *)generateOutput:(NSString *)noun verb:(NSString *)verb {
	NSDictionary *sentenceDictionary = [self getRandomSentenceFromArray];
	
	if([sentenceDictionary[@"nounFirst"] isEqualToString:@"1"]) {
		return [NSString stringWithFormat:sentenceDictionary[@"sentence"], noun, verb];
	}
	else {
		return [NSString stringWithFormat:sentenceDictionary[@"sentence"], verb, noun];
	}
	
}

-(NSDictionary *)getRandomSentenceFromArray {
	
	UInt32 arrayCount = (UInt32)sentences.count;
	UInt32 unsignedRandomNum = arc4random_uniform(arrayCount);
	int randomNumber = (int)unsignedRandomNum;
	
	NSDictionary *randomSentence = sentences[randomNumber];

	return randomSentence;
}

@end

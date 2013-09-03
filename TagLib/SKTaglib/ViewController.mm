//
//  ViewController.m
//  SKTaglib
//
//  Created by 尚 凯 on 13-9-2.
//
//

#import "ViewController.h"
#import "tag.h"
#import "fileref.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *aFile = [[NSBundle mainBundle] pathForResource:@"孩子的眼睛" ofType:@"mp3"];
    
    TagLib::FileRef f([aFile UTF8String]);
    TagLib::Tag *mytag=f.tag();
    TagLib::AudioProperties *aproperties=f.audioProperties();
    TagLib::String title = mytag->title();
    TagLib::String author = mytag->artist();
    TagLib::String album = mytag->album();
    TagLib::String comment = mytag->comment();
    TagLib::String genre = mytag->genre();
    TagLib::uint year = mytag->year();
    TagLib::uint track = mytag->track();
    
    NSString *nsTitle=[NSString stringWithCString:title.toCString(true)
                                         encoding:NSUTF8StringEncoding];
    NSString *nsAuthor = [NSString stringWithCString:author.toCString(true)
                                            encoding:NSUTF8StringEncoding];
    NSString *nsAlbum = [NSString stringWithCString:album.toCString(true)
                                           encoding:NSUTF8StringEncoding];
    NSString *nsComment = [NSString stringWithCString:comment.toCString(true)
                                             encoding:NSUTF8StringEncoding];
    NSString *nsGenre = [NSString stringWithCString:genre.toCString(true)
                                           encoding:NSUTF8StringEncoding];
    
    NSLog(@"title:%@", nsTitle);
    NSLog(@"author:%@", nsAuthor);
    NSLog(@"album:%@", nsAlbum);
    NSLog(@"comment:%@", nsComment);
    NSLog(@"genre:%@", nsGenre);
    NSLog(@"%d", year);
    NSLog(@"track:%d", track);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

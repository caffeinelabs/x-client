/// The media category of media
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PreviewImageMediaKeyMediaCategory.mo
/// Enum values: #tweetimage

module {
    public type PreviewImageMediaKeyMediaCategory = {
        #tweetimage;
    };

    public module JSON {
        public func toCandidValue(value : PreviewImageMediaKeyMediaCategory) : Candid.Candid =
            switch (value) {
                case (#tweetimage) #Text("TweetImage");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?PreviewImageMediaKeyMediaCategory =
            switch (candid) {
                case (#Text("TweetImage")) ?#tweetimage;
                case _ null;
            };

        public func toText(value : PreviewImageMediaKeyMediaCategory) : Text =
            switch (value) {
                case (#tweetimage) "TweetImage";
            };
    };
};

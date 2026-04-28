/// A string enum value which identifies a media use-case. This identifier is used to enforce use-case specific constraints (e.g. file size) and enable advanced features.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MediaCategoryOneShot.mo
/// Enum values: #tweet_image, #dm_image, #subtitles

module {
    public type MediaCategoryOneShot = {
        #tweet_image;
        #dm_image;
        #subtitles;
    };

    public module JSON {
        public func toCandidValue(value : MediaCategoryOneShot) : Candid.Candid =
            switch (value) {
                case (#tweet_image) #Text("tweet_image");
                case (#dm_image) #Text("dm_image");
                case (#subtitles) #Text("subtitles");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaCategoryOneShot =
            switch (candid) {
                case (#Text("tweet_image")) ?#tweet_image;
                case (#Text("dm_image")) ?#dm_image;
                case (#Text("subtitles")) ?#subtitles;
                case _ null;
            };

        public func toText(value : MediaCategoryOneShot) : Text =
            switch (value) {
                case (#tweet_image) "tweet_image";
                case (#dm_image) "dm_image";
                case (#subtitles) "subtitles";
            };
    };
};

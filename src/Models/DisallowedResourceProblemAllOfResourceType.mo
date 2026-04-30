import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DisallowedResourceProblemAllOfResourceType.mo
/// Enum values: #user, #tweet, #media, #list, #space

module {
    public type DisallowedResourceProblemAllOfResourceType = {
        #user;
        #tweet;
        #media;
        #list;
        #space;
    };

    public module JSON {
        public func toCandidValue(value : DisallowedResourceProblemAllOfResourceType) : Candid.Candid =
            switch (value) {
                case (#user) #Text("user");
                case (#tweet) #Text("tweet");
                case (#media) #Text("media");
                case (#list) #Text("list");
                case (#space) #Text("space");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?DisallowedResourceProblemAllOfResourceType =
            switch (candid) {
                case (#Text("user")) ?#user;
                case (#Text("tweet")) ?#tweet;
                case (#Text("media")) ?#media;
                case (#Text("list")) ?#list;
                case (#Text("space")) ?#space;
                case _ null;
            };

        public func toText(value : DisallowedResourceProblemAllOfResourceType) : Text =
            switch (value) {
                case (#user) "user";
                case (#tweet) "tweet";
                case (#media) "media";
                case (#list) "list";
                case (#space) "space";
            };
    };
};

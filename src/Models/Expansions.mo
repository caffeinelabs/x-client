
import { type Media; JSON = Media } "./Media";

import { type Place; JSON = Place } "./Place";

import { type Poll; JSON = Poll } "./Poll";

import { type Topic; JSON = Topic } "./Topic";

import { type Tweet; JSON = Tweet } "./Tweet";

import { type User; JSON = User } "./User";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Expansions.mo

module {
    public type Expansions = {
        media : ?[Media];
        places : ?[Place];
        polls : ?[Poll];
        topics : ?[Topic];
        tweets : ?[Tweet];
        users : ?[User];
    };

    public module JSON {
        public func toCandidValue(value : Expansions) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.media) {
                case (?v__) List.add(buf, ("media", #Array(Array.map<Media, Candid.Candid>(v__, Media.toCandidValue))));
                case null ();
            };
            switch (value.places) {
                case (?v__) List.add(buf, ("places", #Array(Array.map<Place, Candid.Candid>(v__, Place.toCandidValue))));
                case null ();
            };
            switch (value.polls) {
                case (?v__) List.add(buf, ("polls", #Array(Array.map<Poll, Candid.Candid>(v__, Poll.toCandidValue))));
                case null ();
            };
            switch (value.topics) {
                case (?v__) List.add(buf, ("topics", #Array(Array.map<Topic, Candid.Candid>(v__, Topic.toCandidValue))));
                case null ();
            };
            switch (value.tweets) {
                case (?v__) List.add(buf, ("tweets", #Array(Array.map<Tweet, Candid.Candid>(v__, Tweet.toCandidValue))));
                case null ();
            };
            switch (value.users) {
                case (?v__) List.add(buf, ("users", #Array(Array.map<User, Candid.Candid>(v__, User.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Expansions =
            switch (candid) {
                case (#Record(fields)) {
                    let media : ?[Media] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media")) {
                        case (?media_field) ((switch (media_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Media>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Media.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let places : ?[Place] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "places")) {
                        case (?places_field) ((switch (places_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Place>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Place.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let polls : ?[Poll] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "polls")) {
                        case (?polls_field) ((switch (polls_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Poll>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Poll.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let topics : ?[Topic] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "topics")) {
                        case (?topics_field) ((switch (topics_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Topic>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Topic.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let tweets : ?[Tweet] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweets")) {
                        case (?tweets_field) ((switch (tweets_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Tweet>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Tweet.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let users : ?[User] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "users")) {
                        case (?users_field) ((switch (users_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<User>();
                            for (c__ in xs__.values()) {
                                let ?m__ = User.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        media;
                        places;
                        polls;
                        topics;
                        tweets;
                        users;
                    };
                };
                case _ null;
            };
    };
};

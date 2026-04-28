/// Specifies the type of attachments (if any) present in this Tweet.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetAttachments.mo

module {
    public type TweetAttachments = {
        /// A list of Media Keys for each one of the media attachments (if media are attached).
        media_keys : ?[Text];
        /// A list of Posts the media on this Tweet was originally posted in. For example, if the media on a tweet is re-used in another Tweet, this refers to the original, source Tweet..
        media_source_tweet_id : ?[Text];
        /// A list of poll IDs (if polls are attached).
        poll_ids : ?[Text];
    };

    public module JSON {
        public func toCandidValue(value : TweetAttachments) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.media_keys) {
                case (?v__) List.add(buf, ("media_keys", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.media_source_tweet_id) {
                case (?v__) List.add(buf, ("media_source_tweet_id", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.poll_ids) {
                case (?v__) List.add(buf, ("poll_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetAttachments =
            switch (candid) {
                case (#Record(fields)) {
                    let media_keys : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_keys")) {
                        case (?media_keys_field) ((switch (media_keys_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let media_source_tweet_id : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_source_tweet_id")) {
                        case (?media_source_tweet_id_field) ((switch (media_source_tweet_id_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let poll_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "poll_ids")) {
                        case (?poll_ids_field) ((switch (poll_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        media_keys;
                        media_source_tweet_id;
                        poll_ids;
                    };
                };
                case _ null;
            };
    };
};

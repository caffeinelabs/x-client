
import { type DmEventReferencedTweetsInner; JSON = DmEventReferencedTweetsInner } "./DmEventReferencedTweetsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetEditComplianceObjectSchema.mo

module {
    public type TweetEditComplianceObjectSchema = {
        edit_tweet_ids : [Text];
        /// Event time.
        event_at : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        initial_tweet_id : Text;
        tweet : DmEventReferencedTweetsInner;
    };

    public module JSON {
        public func toCandidValue(value : TweetEditComplianceObjectSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("edit_tweet_ids", #Array(Array.map<Text, Candid.Candid>(value.edit_tweet_ids, func(s : Text) : Candid.Candid = #Text(s)))));
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("initial_tweet_id", #Text(value.initial_tweet_id)));
            List.add(buf, ("tweet", DmEventReferencedTweetsInner.toCandidValue(value.tweet)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetEditComplianceObjectSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?edit_tweet_ids_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "edit_tweet_ids") else return null;
                    let ?edit_tweet_ids = ((switch (edit_tweet_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?initial_tweet_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "initial_tweet_id") else return null;
                    let ?initial_tweet_id = ((switch (initial_tweet_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?tweet_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet") else return null;
                    let ?tweet = (DmEventReferencedTweetsInner.fromCandidValue(tweet_field.1)) else return null;
                    ?{
                        edit_tweet_ids;
                        event_at;
                        initial_tweet_id;
                        tweet;
                    };
                };
                case _ null;
            };
    };
};

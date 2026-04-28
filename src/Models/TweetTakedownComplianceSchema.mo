
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetTakedownComplianceSchema.mo

module {
    public type TweetTakedownComplianceSchema = {
        /// Event time.
        event_at : Text;
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        quote_tweet_id : ?Text;
        tweet : TweetComplianceSchemaTweet;
        withheld_in_countries : [Text];
    };

    public module JSON {
        public func toCandidValue(value : TweetTakedownComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_at", #Text(value.event_at)));
            switch (value.quote_tweet_id) {
                case (?v__) List.add(buf, ("quote_tweet_id", #Text(v__)));
                case null ();
            };
            List.add(buf, ("tweet", TweetComplianceSchemaTweet.toCandidValue(value.tweet)));
            List.add(buf, ("withheld_in_countries", #Array(Array.map<Text, Candid.Candid>(value.withheld_in_countries, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetTakedownComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let quote_tweet_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "quote_tweet_id")) {
                        case (?quote_tweet_id_field) ((switch (quote_tweet_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?tweet_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet") else return null;
                    let ?tweet = (TweetComplianceSchemaTweet.fromCandidValue(tweet_field.1)) else return null;
                    let ?withheld_in_countries_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "withheld_in_countries") else return null;
                    let ?withheld_in_countries = ((switch (withheld_in_countries_field.1) {
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
                    ?{
                        event_at;
                        quote_tweet_id;
                        tweet;
                        withheld_in_countries;
                    };
                };
                case _ null;
            };
    };
};

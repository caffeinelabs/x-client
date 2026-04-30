
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetUnviewable.mo

module {
    public type TweetUnviewable = {
        /// If the label is being applied or removed. Possible values are ‘apply’ or ‘remove’.
        application : Text;
        /// Event time.
        event_at : Text;
        tweet : TweetComplianceSchemaTweet;
    };

    public module JSON {
        // `init` constructs a TweetUnviewable from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetUnviewable.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            application : Text;
            event_at : Text;
            tweet : TweetComplianceSchemaTweet;
        }) : TweetUnviewable {
            let ?res = from_candid(to_candid(required)) : ?TweetUnviewable else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetUnviewable) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("application", #Text(value.application)));
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("tweet", TweetComplianceSchemaTweet.toCandidValue(value.tweet)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetUnviewable =
            switch (candid) {
                case (#Record(fields)) {
                    let ?application_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "application") else return null;
                    let ?application = ((switch (application_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?tweet_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet") else return null;
                    let ?tweet = (TweetComplianceSchemaTweet.fromCandidValue(tweet_field.1)) else return null;
                    ?{
                        application;
                        event_at;
                        tweet;
                    };
                };
                case _ null;
            };
    };
};

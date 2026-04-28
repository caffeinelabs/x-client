
import { type TweetComplianceSchemaTweet; JSON = TweetComplianceSchemaTweet } "./TweetComplianceSchemaTweet";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetNotice.mo

module {
    public type TweetNotice = {
        /// If the label is being applied or removed. Possible values are ‘apply’ or ‘remove’.
        application : Text;
        /// Information shown on the Tweet label
        details : ?Text;
        /// Event time.
        event_at : Text;
        /// The type of label on the Tweet
        event_type : Text;
        /// Link to more information about this kind of label
        extended_details_url : ?Text;
        /// Title/header of the Tweet label
        label_title : ?Text;
        tweet : TweetComplianceSchemaTweet;
    };

    public module JSON {
        public func toCandidValue(value : TweetNotice) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("application", #Text(value.application)));
            switch (value.details) {
                case (?v__) List.add(buf, ("details", #Text(v__)));
                case null ();
            };
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("event_type", #Text(value.event_type)));
            switch (value.extended_details_url) {
                case (?v__) List.add(buf, ("extended_details_url", #Text(v__)));
                case null ();
            };
            switch (value.label_title) {
                case (?v__) List.add(buf, ("label_title", #Text(v__)));
                case null ();
            };
            List.add(buf, ("tweet", TweetComplianceSchemaTweet.toCandidValue(value.tweet)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetNotice =
            switch (candid) {
                case (#Record(fields)) {
                    let ?application_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "application") else return null;
                    let ?application = ((switch (application_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let details : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "details")) {
                        case (?details_field) ((switch (details_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?event_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_type") else return null;
                    let ?event_type = ((switch (event_type_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let extended_details_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "extended_details_url")) {
                        case (?extended_details_url_field) ((switch (extended_details_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let label_title : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "label_title")) {
                        case (?label_title_field) ((switch (label_title_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?tweet_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweet") else return null;
                    let ?tweet = (TweetComplianceSchemaTweet.fromCandidValue(tweet_field.1)) else return null;
                    ?{
                        application;
                        details;
                        event_at;
                        event_type;
                        extended_details_url;
                        label_title;
                        tweet;
                    };
                };
                case _ null;
            };
    };
};

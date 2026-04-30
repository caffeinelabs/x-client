/// Poll options for a Tweet with a poll. This is mutually exclusive from Media, Quote Tweet Id, and Card URI.

import { type TweetCreateRequestPollReplySettings; JSON = TweetCreateRequestPollReplySettings } "./TweetCreateRequestPollReplySettings";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// TweetCreateRequestPoll.mo

module {
    public type TweetCreateRequestPoll = {
        /// Duration of the poll in minutes.
        duration_minutes : Nat;
        options : [Text];
        reply_settings : ?TweetCreateRequestPollReplySettings;
    };

    public module JSON {
        // `init` constructs a TweetCreateRequestPoll from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetCreateRequestPoll.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            duration_minutes : Nat;
            options : [Text];
        }) : TweetCreateRequestPoll {
            let ?res = from_candid(to_candid(required)) : ?TweetCreateRequestPoll else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetCreateRequestPoll) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("duration_minutes", #Nat(value.duration_minutes)));
            List.add(buf, ("options", #Array(Array.map<Text, Candid.Candid>(value.options, func(s : Text) : Candid.Candid = #Text(s)))));
            switch (value.reply_settings) {
                case (?v__) List.add(buf, ("reply_settings", TweetCreateRequestPollReplySettings.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequestPoll =
            switch (candid) {
                case (#Record(fields)) {
                    let ?duration_minutes_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "duration_minutes") else return null;
                    let ?duration_minutes = ((switch (duration_minutes_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null })) else return null;
                    let ?options_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "options") else return null;
                    let ?options = ((switch (options_field.1) {
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
                    let reply_settings : ?TweetCreateRequestPollReplySettings = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "reply_settings")) {
                        case (?reply_settings_field) (TweetCreateRequestPollReplySettings.fromCandidValue(reply_settings_field.1));
                        case null null;
                    };
                    ?{
                        duration_minutes;
                        options;
                        reply_settings;
                    };
                };
                case _ null;
            };
    };
};

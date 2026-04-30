/// Tweet information of the Tweet being replied to.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetCreateRequestReply.mo

module {
    public type TweetCreateRequestReply = {
        /// If set to true, reply metadata will be automatically populated.
        auto_populate_reply_metadata : ?Bool;
        /// A list of User Ids to be excluded from the reply Tweet.
        exclude_reply_user_ids : ?[Text];
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        in_reply_to_tweet_id : Text;
    };

    public module JSON {
        // `init` constructs a TweetCreateRequestReply from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetCreateRequestReply.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            in_reply_to_tweet_id : Text;
        }) : TweetCreateRequestReply {
            let ?res = from_candid(to_candid(required)) : ?TweetCreateRequestReply else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetCreateRequestReply) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.auto_populate_reply_metadata) {
                case (?v__) List.add(buf, ("auto_populate_reply_metadata", #Bool(v__)));
                case null ();
            };
            switch (value.exclude_reply_user_ids) {
                case (?v__) List.add(buf, ("exclude_reply_user_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            List.add(buf, ("in_reply_to_tweet_id", #Text(value.in_reply_to_tweet_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetCreateRequestReply =
            switch (candid) {
                case (#Record(fields)) {
                    let auto_populate_reply_metadata : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "auto_populate_reply_metadata")) {
                        case (?auto_populate_reply_metadata_field) ((switch (auto_populate_reply_metadata_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let exclude_reply_user_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "exclude_reply_user_ids")) {
                        case (?exclude_reply_user_ids_field) ((switch (exclude_reply_user_ids_field.1) {
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
                    let ?in_reply_to_tweet_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "in_reply_to_tweet_id") else return null;
                    let ?in_reply_to_tweet_id = ((switch (in_reply_to_tweet_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        auto_populate_reply_metadata;
                        exclude_reply_user_ids;
                        in_reply_to_tweet_id;
                    };
                };
                case _ null;
            };
    };
};

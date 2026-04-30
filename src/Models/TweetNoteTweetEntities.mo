
import { type CashtagEntity; JSON = CashtagEntity } "./CashtagEntity";

import { type HashtagEntity; JSON = HashtagEntity } "./HashtagEntity";

import { type MentionEntity; JSON = MentionEntity } "./MentionEntity";

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetNoteTweetEntities.mo

module {
    public type TweetNoteTweetEntities = {
        cashtags : ?[CashtagEntity];
        hashtags : ?[HashtagEntity];
        mentions : ?[MentionEntity];
        urls : ?[UrlEntity];
    };

    public module JSON {
        // `init` constructs a TweetNoteTweetEntities from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TweetNoteTweetEntities.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : TweetNoteTweetEntities {
            let ?res = from_candid(to_candid(required)) : ?TweetNoteTweetEntities else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TweetNoteTweetEntities) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.cashtags) {
                case (?v__) List.add(buf, ("cashtags", #Array(Array.map<CashtagEntity, Candid.Candid>(v__, CashtagEntity.toCandidValue))));
                case null ();
            };
            switch (value.hashtags) {
                case (?v__) List.add(buf, ("hashtags", #Array(Array.map<HashtagEntity, Candid.Candid>(v__, HashtagEntity.toCandidValue))));
                case null ();
            };
            switch (value.mentions) {
                case (?v__) List.add(buf, ("mentions", #Array(Array.map<MentionEntity, Candid.Candid>(v__, MentionEntity.toCandidValue))));
                case null ();
            };
            switch (value.urls) {
                case (?v__) List.add(buf, ("urls", #Array(Array.map<UrlEntity, Candid.Candid>(v__, UrlEntity.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetNoteTweetEntities =
            switch (candid) {
                case (#Record(fields)) {
                    let cashtags : ?[CashtagEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "cashtags")) {
                        case (?cashtags_field) ((switch (cashtags_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<CashtagEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = CashtagEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let hashtags : ?[HashtagEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hashtags")) {
                        case (?hashtags_field) ((switch (hashtags_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<HashtagEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = HashtagEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let mentions : ?[MentionEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "mentions")) {
                        case (?mentions_field) ((switch (mentions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<MentionEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = MentionEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let urls : ?[UrlEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "urls")) {
                        case (?urls_field) ((switch (urls_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UrlEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UrlEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        cashtags;
                        hashtags;
                        mentions;
                        urls;
                    };
                };
                case _ null;
            };
    };
};

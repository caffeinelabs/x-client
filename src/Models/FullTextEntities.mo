
import { type CashtagEntity; JSON = CashtagEntity } "./CashtagEntity";

import { type FullTextEntitiesAnnotationsInner; JSON = FullTextEntitiesAnnotationsInner } "./FullTextEntitiesAnnotationsInner";

import { type HashtagEntity; JSON = HashtagEntity } "./HashtagEntity";

import { type MentionEntity; JSON = MentionEntity } "./MentionEntity";

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// FullTextEntities.mo

module {
    public type FullTextEntities = {
        annotations : ?[FullTextEntitiesAnnotationsInner];
        cashtags : ?[CashtagEntity];
        hashtags : ?[HashtagEntity];
        mentions : ?[MentionEntity];
        urls : ?[UrlEntity];
    };

    public module JSON {
        public func toCandidValue(value : FullTextEntities) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.annotations) {
                case (?v__) List.add(buf, ("annotations", #Array(Array.map<FullTextEntitiesAnnotationsInner, Candid.Candid>(v__, FullTextEntitiesAnnotationsInner.toCandidValue))));
                case null ();
            };
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

        public func fromCandidValue(candid : Candid.Candid) : ?FullTextEntities =
            switch (candid) {
                case (#Record(fields)) {
                    let annotations : ?[FullTextEntitiesAnnotationsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "annotations")) {
                        case (?annotations_field) ((switch (annotations_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<FullTextEntitiesAnnotationsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = FullTextEntitiesAnnotationsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
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
                        annotations;
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

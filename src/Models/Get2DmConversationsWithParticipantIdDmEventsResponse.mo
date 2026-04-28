
import { type DmEvent; JSON = DmEvent } "./DmEvent";

import { type Expansions; JSON = Expansions } "./Expansions";

import { type Get2DmConversationsIdDmEventsResponseMeta; JSON = Get2DmConversationsIdDmEventsResponseMeta } "./Get2DmConversationsIdDmEventsResponseMeta";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Get2DmConversationsWithParticipantIdDmEventsResponse.mo

module {
    public type Get2DmConversationsWithParticipantIdDmEventsResponse = {
        data : ?[DmEvent];
        errors : ?[Problem];
        includes : ?Expansions;
        meta : ?Get2DmConversationsIdDmEventsResponseMeta;
    };

    public module JSON {
        public func toCandidValue(value : Get2DmConversationsWithParticipantIdDmEventsResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<DmEvent, Candid.Candid>(v__, DmEvent.toCandidValue))));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            switch (value.includes) {
                case (?v__) List.add(buf, ("includes", Expansions.toCandidValue(v__)));
                case null ();
            };
            switch (value.meta) {
                case (?v__) List.add(buf, ("meta", Get2DmConversationsIdDmEventsResponseMeta.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2DmConversationsWithParticipantIdDmEventsResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[DmEvent] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<DmEvent>();
                            for (c__ in xs__.values()) {
                                let ?m__ = DmEvent.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let errors : ?[Problem] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let includes : ?Expansions = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "includes")) {
                        case (?includes_field) (Expansions.fromCandidValue(includes_field.1));
                        case null null;
                    };
                    let meta : ?Get2DmConversationsIdDmEventsResponseMeta = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta")) {
                        case (?meta_field) (Get2DmConversationsIdDmEventsResponseMeta.fromCandidValue(meta_field.1));
                        case null null;
                    };
                    ?{
                        data;
                        errors;
                        includes;
                        meta;
                    };
                };
                case _ null;
            };
    };
};

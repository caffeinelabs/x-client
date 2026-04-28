
import { type ProcessingInfoState; JSON = ProcessingInfoState } "./ProcessingInfoState";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ProcessingInfo.mo

module {
    public type ProcessingInfo = {
        /// Number of seconds to check again for status
        check_after_secs : ?Int;
        /// Percent of upload progress
        progress_percent : ?Int;
        state : ?ProcessingInfoState;
    };

    public module JSON {
        public func toCandidValue(value : ProcessingInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.check_after_secs) {
                case (?v__) List.add(buf, ("check_after_secs", #Int(v__)));
                case null ();
            };
            switch (value.progress_percent) {
                case (?v__) List.add(buf, ("progress_percent", #Int(v__)));
                case null ();
            };
            switch (value.state) {
                case (?v__) List.add(buf, ("state", ProcessingInfoState.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ProcessingInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let check_after_secs : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "check_after_secs")) {
                        case (?check_after_secs_field) ((switch (check_after_secs_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let progress_percent : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "progress_percent")) {
                        case (?progress_percent_field) ((switch (progress_percent_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let state : ?ProcessingInfoState = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "state")) {
                        case (?state_field) (ProcessingInfoState.fromCandidValue(state_field.1));
                        case null null;
                    };
                    ?{
                        check_after_secs;
                        progress_percent;
                        state;
                    };
                };
                case _ null;
            };
    };
};

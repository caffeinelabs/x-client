/// Represent a Poll attached to a Tweet.

import { type PollOption; JSON = PollOption } "./PollOption";

import { type PollVotingStatus; JSON = PollVotingStatus } "./PollVotingStatus";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// Poll.mo

module {
    /// The required-fields slice of Poll — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Unique identifier of this poll.
        id : Text;
        options : [PollOption];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Poll as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        duration_minutes : ?Nat;
        end_datetime : ?Text;
        voting_status : ?PollVotingStatus;
    };

    public type Poll = Required and Optional;

    public module JSON {
        // `init` constructs a Poll from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Poll.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Poll {
            let ?res = from_candid(to_candid(required)) : ?Poll else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Poll) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.duration_minutes) {
                case (?v__) List.add(buf, ("duration_minutes", #Nat(v__)));
                case null ();
            };
            switch (value.end_datetime) {
                case (?v__) List.add(buf, ("end_datetime", #Text(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            List.add(buf, ("options", #Array(Array.map<PollOption, Candid.Candid>(value.options, PollOption.toCandidValue))));
            switch (value.voting_status) {
                case (?v__) List.add(buf, ("voting_status", PollVotingStatus.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Poll =
            switch (candid) {
                case (#Record(fields)) {
                    let duration_minutes : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "duration_minutes")) {
                        case (?duration_minutes_field) ((switch (duration_minutes_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    let end_datetime : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "end_datetime")) {
                        case (?end_datetime_field) ((switch (end_datetime_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?options_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "options") else return null;
                    let ?options = ((switch (options_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<PollOption>();
                            for (c__ in xs__.values()) {
                                let ?m__ = PollOption.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let voting_status : ?PollVotingStatus = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "voting_status")) {
                        case (?voting_status_field) (PollVotingStatus.fromCandidValue(voting_status_field.1));
                        case null null;
                    };
                    ?{
                        duration_minutes;
                        end_datetime;
                        id;
                        options;
                        voting_status;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};

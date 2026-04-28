
import { type User; JSON = User } "./User";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// FollowActivityResponsePayload.mo

module {
    public type FollowActivityResponsePayload = {
        source : ?User;
        target : ?User;
    };

    public module JSON {
        public func toCandidValue(value : FollowActivityResponsePayload) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.source) {
                case (?v__) List.add(buf, ("source", User.toCandidValue(v__)));
                case null ();
            };
            switch (value.target) {
                case (?v__) List.add(buf, ("target", User.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?FollowActivityResponsePayload =
            switch (candid) {
                case (#Record(fields)) {
                    let source : ?User = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "source")) {
                        case (?source_field) (User.fromCandidValue(source_field.1));
                        case null null;
                    };
                    let target : ?User = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "target")) {
                        case (?target_field) (User.fromCandidValue(target_field.1));
                        case null null;
                    };
                    ?{
                        source;
                        target;
                    };
                };
                case _ null;
            };
    };
};

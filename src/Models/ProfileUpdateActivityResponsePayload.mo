import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ProfileUpdateActivityResponsePayload.mo

module {
    public type ProfileUpdateActivityResponsePayload = {
        after : ?Text;
        before : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ProfileUpdateActivityResponsePayload) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.after) {
                case (?v__) List.add(buf, ("after", #Text(v__)));
                case null ();
            };
            switch (value.before) {
                case (?v__) List.add(buf, ("before", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ProfileUpdateActivityResponsePayload =
            switch (candid) {
                case (#Record(fields)) {
                    let after : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "after")) {
                        case (?after_field) ((switch (after_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let before : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "before")) {
                        case (?before_field) ((switch (before_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        after;
                        before;
                    };
                };
                case _ null;
            };
    };
};


import Int "mo:core/Int";

// MediaSegments.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type MediaSegments = {
        #one_of_0 : Nat;
        #one_of_1 : Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : MediaSegments) : Text =
            switch (value) {
                case (#one_of_0(v)) Int.toText(v);
                case (#one_of_1(v)) Int.toText(v);
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MediaSegments type
        public type JSON = {
            #one_of_0 : Int;
            #one_of_1 : Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MediaSegments) : JSON =
            switch (value) {
                case (#one_of_0(v)) #one_of_0(v);
                case (#one_of_1(v)) #one_of_1(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MediaSegments =
            switch (json) {
                case (#one_of_0(v)) if (v < 0) null else ?#one_of_0(Int.abs(v));
                case (#one_of_1(v)) ?#one_of_1(v);
            };
    }
}

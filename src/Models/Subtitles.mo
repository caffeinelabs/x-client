import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Subtitles.mo

module {
    public type Subtitles = {
        /// Language name in a human readable form
        display_name : ?Text;
        /// The unique identifier of this Media.
        id : ?Text;
        /// The language code should be a BCP47 code (e.g. 'EN\", \"SP\")
        language_code : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : Subtitles) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.display_name) {
                case (?v__) List.add(buf, ("display_name", #Text(v__)));
                case null ();
            };
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.language_code) {
                case (?v__) List.add(buf, ("language_code", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Subtitles =
            switch (candid) {
                case (#Record(fields)) {
                    let display_name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "display_name")) {
                        case (?display_name_field) ((switch (display_name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let language_code : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "language_code")) {
                        case (?language_code_field) ((switch (language_code_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        display_name;
                        id;
                        language_code;
                    };
                };
                case _ null;
            };
    };
};

import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// NewsActivityResponsePayload.mo

module {
    public type NewsActivityResponsePayload = {
        category : ?Text;
        headline : ?Text;
        hook : ?Text;
        summary : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : NewsActivityResponsePayload) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.category) {
                case (?v__) List.add(buf, ("category", #Text(v__)));
                case null ();
            };
            switch (value.headline) {
                case (?v__) List.add(buf, ("headline", #Text(v__)));
                case null ();
            };
            switch (value.hook) {
                case (?v__) List.add(buf, ("hook", #Text(v__)));
                case null ();
            };
            switch (value.summary) {
                case (?v__) List.add(buf, ("summary", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NewsActivityResponsePayload =
            switch (candid) {
                case (#Record(fields)) {
                    let category : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "category")) {
                        case (?category_field) ((switch (category_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let headline : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "headline")) {
                        case (?headline_field) ((switch (headline_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let hook : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hook")) {
                        case (?hook_field) ((switch (hook_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let summary : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "summary")) {
                        case (?summary_field) ((switch (summary_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        category;
                        headline;
                        hook;
                        summary;
                    };
                };
                case _ null;
            };
    };
};

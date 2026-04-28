
import { type PreviewImageMediaKeyMediaCategory; JSON = PreviewImageMediaKeyMediaCategory } "./PreviewImageMediaKeyMediaCategory";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PreviewImageMediaKey.mo

module {
    public type PreviewImageMediaKey = {
        /// The unique identifier of this Media.
        media : ?Text;
        media_category : ?PreviewImageMediaKeyMediaCategory;
    };

    public module JSON {
        public func toCandidValue(value : PreviewImageMediaKey) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.media) {
                case (?v__) List.add(buf, ("media", #Text(v__)));
                case null ();
            };
            switch (value.media_category) {
                case (?v__) List.add(buf, ("media_category", PreviewImageMediaKeyMediaCategory.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PreviewImageMediaKey =
            switch (candid) {
                case (#Record(fields)) {
                    let media : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media")) {
                        case (?media_field) ((switch (media_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let media_category : ?PreviewImageMediaKeyMediaCategory = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category")) {
                        case (?media_category_field) (PreviewImageMediaKeyMediaCategory.fromCandidValue(media_category_field.1));
                        case null null;
                    };
                    ?{
                        media;
                        media_category;
                    };
                };
                case _ null;
            };
    };
};

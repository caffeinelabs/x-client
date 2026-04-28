
import { type MediaCategorySubtitles; JSON = MediaCategorySubtitles } "./MediaCategorySubtitles";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SubtitlesDeleteRequest.mo

module {
    public type SubtitlesDeleteRequest = {
        /// The unique identifier of this Media.
        id : ?Text;
        /// The language code should be a BCP47 code (e.g. 'EN\", \"SP\")
        language_code : ?Text;
        media_category : ?MediaCategorySubtitles;
    };

    public module JSON {
        public func toCandidValue(value : SubtitlesDeleteRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.language_code) {
                case (?v__) List.add(buf, ("language_code", #Text(v__)));
                case null ();
            };
            switch (value.media_category) {
                case (?v__) List.add(buf, ("media_category", MediaCategorySubtitles.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?SubtitlesDeleteRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let language_code : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "language_code")) {
                        case (?language_code_field) ((switch (language_code_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let media_category : ?MediaCategorySubtitles = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category")) {
                        case (?media_category_field) (MediaCategorySubtitles.fromCandidValue(media_category_field.1));
                        case null null;
                    };
                    ?{
                        id;
                        language_code;
                        media_category;
                    };
                };
                case _ null;
            };
    };
};

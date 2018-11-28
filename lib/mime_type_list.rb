require "mime_type_list/version"

module MimeTypeList
  class BaseType
    class << self
      def append_non_standard_extensions(non_standard_extensions, extensions)
        extensions_to_add = non_standard_extensions.select { |ext| !extensions.include?(ext) }
        extensions.concat(extensions_to_add)
      end
    end
  end

  class AudioMimeTypes < BaseType
    class << self
      NON_STANDARD_EXTENSIONS = ["m4a"].freeze

      def extensions_for(mime_type)
        mime_types = MIME::Types[mime_type]
        mime_types.map {|t| t.extensions }.flatten
      end

      def all_extensions
        extensions = @all_extensions ||= all_mime_types.map do |mime_type|
          extensions_for(mime_type)
        end.flatten.uniq.sort
        append_non_standard_extensions(NON_STANDARD_EXTENSIONS, extensions)
      end

      def all_mime_types
        %W{
          audio/aac
          audio/mpeg
          audio/ogg
          audio/wav
        }
      end

    end
  end

  class VideoMimeTypes < BaseType
    class << self

      NON_STANDARD_EXTENSIONS = ["m4v"].freeze

      def extensions_for(mime_type)
        mime_types = MIME::Types[mime_type]
        mime_types.map {|t| t.extensions }.flatten
      end

      def all_extensions
        extensions = @all_extensions ||= all_mime_types.map do |mime_type|
          extensions_for(mime_type)
        end.flatten.uniq.sort
        append_non_standard_extensions(NON_STANDARD_EXTENSIONS, extensions)
      end

      def all_mime_types
        %W{
          application/annodex
          application/mp4
          application/ogg
          application/vnd.rn-realmedia
          application/x-matroska
          video/3gpp
          video/3gpp2
          video/annodex
          video/divx
          video/flv
          video/h264
          video/mp4
          video/mp4v-es
          video/mpeg
          video/mpeg-2
          video/mpeg4
          video/ogg
          video/ogm
          video/quicktime
          video/ty
          video/vdo
          video/vivo
          video/vnd.rn-realvideo
          video/vnd.vivo
          video/webm
          video/x-bin
          video/x-cdg
          video/x-divx
          video/x-dv
          video/x-flv
          video/x-la-asf
          video/x-m4v
          video/x-matroska
          video/x-motion-jpeg
          video/x-ms-asf
          video/x-ms-dvr
          video/x-ms-wm
          video/x-ms-wmv
          video/x-msvideo
          video/x-sgi-movie
          video/x-tivo
          video/avi
          video/x-ms-asx
          video/x-ms-wvx
          video/x-ms-wmx
        }
      end
    end
  end
end

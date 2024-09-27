module Liquid
  module Rails
    module TranslateFilter
      def translate(key, options={})
        # convert keys to symbols for compatibility with I18n
        options = options.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

        options = { locale: ::I18n.locale.to_s }.merge(options)

        @context.registers[:view].translate(key, **options)
      end
      alias_method :t, :translate
    end
  end
end

Liquid::Template.register_filter Liquid::Rails::TranslateFilter
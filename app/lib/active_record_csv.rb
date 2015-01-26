class ActiveRecordCsv

  def self.to_csv(source, options={})
    source = [source] unless source.respond_to?(:each)

    return '' if source.empty?
    return source.join(',') unless source.first.class.respond_to? :column_names

    columns = source.first.class.column_names
    columns &= options[:only].map(&:to_s) if options[:only]
    columns -= options[:except].map(&:to_s) if options[:except]
    columns += options[:add_methods].map(&:to_s) if options[:add_methods]

    csv = [columns.join(',')]
    csv.concat(source.map {|v| columns.map {|c| v.send(c) }.join(',') })

    csv.join("\n")
  end
end

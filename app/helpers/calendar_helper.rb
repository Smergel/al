module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  class Calendar < Struct.new(:view, :date, :callback)
    HEADER = %w[Pickday Tuesday Wednesday Thursday Friday Saturday Sunday]
    START_DAY = :monday

    delegate :content_tag, to: :view

    def schedule
      picker = ["Jake's Pick", "Bill's Pick", "Jared's Pick", "Andrew's Pick", "Steve's Pick"]
    end

    def table
      content_tag :table, class: "calendar" do 
        header + week_rows
      end
    end

    def header 
      content_tag :tr do 
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do 
          week.map { |day| day_cell(day) }.join.html_safe
        end 
      end.join.html_safe
    end

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes << "jake" if day == Date.new(2015, 11, 9) || (day - Date.new(2015, 11, 9)).to_i % 70 == 0 
      classes << "bill" if day == Date.new(2015, 11, 23) || (day - Date.new(2015, 11, 23)).to_i % 70 == 0 
      classes << "jared" if day == Date.new(2015, 9, 28) || (day - Date.new(2015, 9, 28)).to_i % 70 == 0 
      classes << "andrew" if day == Date.new(2015, 10, 12) || (day - Date.new(2015, 10, 12)).to_i % 70 == 0 
      classes << "steve" if day == Date.new(2015, 10, 26) || (day - Date.new(2015, 10, 26)).to_i % 70 == 0  
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
end
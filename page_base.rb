# ww coding challenge
# by Xiao Meng Wei
# Jan 20 2019
#
# Question 2 (cont.)

class PageBase

  # generic methods for page operations

  def get_object(css)
    $browser.element(css: css).wait_until(&:present?)
  end

  def click(css)
    obj = get_object(css)
    obj.scroll.to :center
    obj.click
  end

  def enter_text(css, text)
    obj = get_object(css)
    obj.scroll.to :center
    obj.to_subtype.clear
    obj.send_keys(text)
  end

  def go_home(url = 'https://www.weightwatchers.com/us/')
    $browser.goto(url)
  end

  def title
    $browser.title
  end

  def wait_until_present(css)
    object = get_object(css)
    object.wait_until(&:present?)
  end

  # page specific methods
  # should be in separate files in reality

  def print_first_result(css)
    obj = get_object(css)
    res = obj.text.split("\n")
    puts res[0]
    puts res[1]
  end

  def getScheduleSummary(option, css)
    result = Hash.new(0)
    days = $browser.elements(css: css)

    days.each do |day|
      if day.text.upcase == option.upcase
        schedule = day.parent.text.split("\n")
        puts schedule[0] + " is selected: "

        i = 2
        while i < schedule.size do
          result[schedule[i].to_sym] += 1
          i += 2
        end

        break
      end
    end

    # print names with frequency as requested in the question
    result.each do |key, value|
      puts "Name: #{key}  Total: #{value} time(s)"
    end
  end
end
class MealDecorator < Draper::Decorator
  delegate_all

  def listed
    "First Courses: \n"\
    "#{firs_courses}"\
    "Main Courses: \n"\
    "#{main_courses}"\
    "Beverages: \n"\
    "#{beverages}"
  end

  private

  def firs_courses

  end

  def main_courses

  end

  def beverages

  end
end

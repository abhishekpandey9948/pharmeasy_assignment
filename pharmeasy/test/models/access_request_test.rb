require 'test_helper'

class AccessRequestTest < ActiveSupport::TestCase

  #must fail
  test "should not have access request without requestee and requester" do
    patient = create_patient
    doctor = create_doctor
    access_request = AccessRequest.new
    access_request.requestee = patient
    assert access_request.save!
  end

  #must pass
  test "check for creating access request" do
    patient = create_patient
    doctor = create_doctor
    access_request = AccessRequest.new
    access_request.requestee = patient
    access_request.requester = doctor
    assert access_request.save!
  end

  private

  def create_patient
    patient = User.new
    patient.email = 'abhishek.pandey@gmail.com'
    patient.password = 'abhishek'
    patient.users_role = patient_role
    patient.save
    patient
  end

  def create_doctor
    doctor = User.new
    doctor.email = 'abhishek.pandey@gmail.com'
    doctor.password = 'abhishek'
    doctor.users_role = doctor_role
    doctor.save
    doctor
  end

  def patient_role
    user_role = ::Users::Role.new
    user_role.name = 'Patient'
    user_role.save!
    user_role
  end

  def doctor_role
    user_role = ::Users::Role.new
    user_role.name = 'Patient'
    user_role.save!
    user_role
  end

end

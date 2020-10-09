<template>
    <app-layout>

        <div>
            <div class="max-w-7xl mx-auto py-10 sm:px-6 lg:px-8">

                <update-profile-information-form
                            :name="$page.user.name"
                            :email="$page.user.email" />


                <update-password-form class="mt-0 sm:mt-2" />

                <logout-other-browser-sessions-form :sessions="sessions" class="my-2 sm:mt-0" />

                <div v-if="$page.jetstream.canManageTwoFactorAuthentication">
                    <section-border />

                    <two-factor-authentication-form class="my-2 sm:mt-0" />
                </div>



                <delete-user-form class="mt-10 sm:mt-0" />
            </div>
        </div>
    </app-layout>
</template>

<script>
    import AppLayout from './../../Layouts/AppLayout'
    import DeleteUserForm from './DeleteUserForm'
    import SectionBorder from './../../components/SectionBorder'
    import LogoutOtherBrowserSessionsForm from './LogoutOtherBrowserSessionsForm'
    import TwoFactorAuthenticationForm from './TwoFactorAuthenticationForm'
    import UpdatePasswordForm from './UpdatePasswordForm'
    import UpdateProfileInformationForm from './UpdateProfileInformationForm'

    export default {
        props: ['sessions'],

        components: {
            AppLayout,
            DeleteUserForm,
            SectionBorder,
            LogoutOtherBrowserSessionsForm,
            TwoFactorAuthenticationForm,
            UpdatePasswordForm,
            UpdateProfileInformationForm,
        },
    }
</script>

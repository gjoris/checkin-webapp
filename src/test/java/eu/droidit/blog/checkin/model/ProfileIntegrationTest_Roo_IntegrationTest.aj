// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.droidit.blog.checkin.model;

import eu.droidit.blog.checkin.model.Profile;
import eu.droidit.blog.checkin.model.ProfileDataOnDemand;
import eu.droidit.blog.checkin.model.ProfileIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProfileIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ProfileIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ProfileIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ProfileIntegrationTest: @Transactional;
    
    @Autowired
    ProfileDataOnDemand ProfileIntegrationTest.dod;
    
    @Test
    public void ProfileIntegrationTest.testCountProfiles() {
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", dod.getRandomProfile());
        long count = Profile.countProfiles();
        Assert.assertTrue("Counter for 'Profile' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ProfileIntegrationTest.testFindProfile() {
        Profile obj = dod.getRandomProfile();
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Profile' failed to provide an identifier", id);
        obj = Profile.findProfile(id);
        Assert.assertNotNull("Find method for 'Profile' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Profile' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ProfileIntegrationTest.testFindAllProfiles() {
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", dod.getRandomProfile());
        long count = Profile.countProfiles();
        Assert.assertTrue("Too expensive to perform a find all test for 'Profile', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Profile> result = Profile.findAllProfiles();
        Assert.assertNotNull("Find all method for 'Profile' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Profile' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ProfileIntegrationTest.testFindProfileEntries() {
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", dod.getRandomProfile());
        long count = Profile.countProfiles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Profile> result = Profile.findProfileEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Profile' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Profile' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ProfileIntegrationTest.testFlush() {
        Profile obj = dod.getRandomProfile();
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Profile' failed to provide an identifier", id);
        obj = Profile.findProfile(id);
        Assert.assertNotNull("Find method for 'Profile' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyProfile(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Profile' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProfileIntegrationTest.testMergeUpdate() {
        Profile obj = dod.getRandomProfile();
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Profile' failed to provide an identifier", id);
        obj = Profile.findProfile(id);
        boolean modified =  dod.modifyProfile(obj);
        Integer currentVersion = obj.getVersion();
        Profile merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Profile' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ProfileIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", dod.getRandomProfile());
        Profile obj = dod.getNewTransientProfile(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Profile' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Profile' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Profile' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ProfileIntegrationTest.testRemove() {
        Profile obj = dod.getRandomProfile();
        Assert.assertNotNull("Data on demand for 'Profile' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Profile' failed to provide an identifier", id);
        obj = Profile.findProfile(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Profile' with identifier '" + id + "'", Profile.findProfile(id));
    }
    
}
